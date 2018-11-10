<style scoped>
  .strike {
    text-decoration: line-through;
  }
</style>
<template>
  <div class="field is-grouped">
    <p class="control" v-if="! editing">
      <b-checkbox v-model="item.done" :disabled="! 'created_at' in item"></b-checkbox>
    </p>
    <div class="control is-expanded">
      <!--  -->
      <div v-if="!editing" :class="item.done ? 'strike' : ''" v-text="item.content" @click="focusOnOpen"></div>
      <div v-else>
        <b-input type="text"
          placeholder="Enter here.."
          v-model="item.content"
          @blur="closeAndReset"
          @keyup.enter.native="rename"
          :id="id"
        >
        </b-input>
        <!-- <b-input placeholder="Enter Here..." type="Text"></b-input> -->
      </div>
    </div>
  </div>
</template>

<script>
  import toasts from '../mixins/toasts'

  export default {
    mixins: [ toasts ],

    props: {
      item: {
        type: Object,
        required: true,
      },
      id: {
        type: String,
        default () {
          return 'item-' + Math.round(Math.random() * 10000)
        }
      }
    },

    data() {
      return {
        editing: false,
        syncing: false,
        originalContent: this.item.content,
        dataToUpdate: ['id', 'content', 'done']
      }
    },

    watch: {
      'item.done': function(value) {
        // sync the item's status to the server
        this.saveItem()

        // save the new history message here
        let message

        // create the appropriate message
        if (value) {
          message = 'You completed the task "' + this.item.content + '"'
        } else {
          message = 'You marked the task "' + this.item.content + '" as undone'
        }

        // record history
        this.recordHistory(message)
      }
    },

    methods:  {
      setEditing (value) {
        this.editing = value
      },

      closeAndReset () {
        // if blurred but not saved, put it back to the original content
        if (! this.syncing) {
          this.item.content = this.originalContent
        }

        this.editing = false
      },

      rename () {
        // do not update if content is empty
        if (this.item.content == '') {
          return
        }

        // do not update if content wasn't udpated
        if (this.item.content == this.originalContent) {
          return
        }

        // if we reach here, the content was changed, update the item!
        this.saveItem()

        // emit the event so parent can update history
        this.recordHistory('You renamed a task from "'
            + this.originalContent + '" to "' + this.item.content)
      },

      recordHistory(event) {
        // emit a historical event so parent can publish it in the history books!
        this.$emit('historical', event)
      },

      saveItem () {
        // update the UI immediately to make it feel snappy!
        this.syncing = true
        this.editing = false

        axios.put(url('todo_items/' + this.item.id), this.item).then(response => {
          if (response.data.status == 'success') {
            this.$toast.open({
              message: 'Task Successfully Updated!',
              type: 'is-success'
            })

            // now we have a new 'original' content
            this.originalContent = this.item.content
          }

          // put back syncing state
          this.syncing = false
        }).catch(error => {
          // oops!
          // put the content back since it wasn't saved
          this.item.content = this.originalContent

          // put it back to editing
          this.editing = true

          // let the user know
          this.error(error)

          // put back syncing state
          this.syncing = false
        })
      },

      focusOnOpen () {
        this.editing = true

        this.$nextTick(() => {
          $('#' + this.id).focus();
        })
      }
    }
  };
</script>
