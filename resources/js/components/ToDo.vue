<template>
  <div>
    <nav class="panel">
      <p class="panel-heading">
        TODO List
      </p>
      <p class="panel-tabs">
        <a :class="hidden ? 'is-active' : ''" @click="toggleHidden">
          <span v-text="hidden ? 'Show' : 'Hide'"></span> Completed Tasks
        </a>
      </p>
      <div v-for="(todo_item, index) in items">
        <div v-show="isShownTask(todo_item)">
          <div class="panel-block is-block">
            <div class="columns is-gapless">
              <div class="column is-11-desktop">
                <to-do-item :item="todo_item" @historical="recordHistory" :key="'todo-' + todo_item.id"></to-do-item>
              </div>
              <div class="column is-1-desktop has-text-right">
                <button class="button is-rounded is-small" @click="removeItem(index, todo_item)"><span class="fa fa-remove"></span></button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="panel-block is-block">
        <div class="columns is-gapless">
          <div class="column is-12-desktop">
            <b-input placeholder="Enter Here..." v-model="newItem" @keyup.enter.native="addNewItem" type="Text"></b-input>
          </div>
        </div>
      </div>
    </nav>

    <nav class="panel">
      <p class="panel-heading">
        History
      </p>
      <div class="panel-block is-block" v-for="event in backToTheFuture" v-text="event.content">
      </div>
    </nav>
  </div>
</template>

<script>
  import toasts from '../mixins/toasts'

  export default {
    mixins: [ toasts ],

    props: {
      items: {
        type: Array,
        required: true,
      },
      history: {
        type: Array,
        required: true,
      }
    },

    data() {
      return {
        newItem: '',
        hidden: false,
      }
    },

    computed: {
      backToTheFuture () {
        return this.history.slice().reverse()
      }
    },

    methods:  {
      toggleHidden () {
        this.hidden = ! this.hidden
      },

      isShownTask (task) {
        if (this.hidden) {
          return ! task.done
        }

        return true
      },

      addNewItem () {
        if (_.isEmpty(this.newItem)) {
          return
        }

        // create a new id hash
        const id = 'new-' + Math.round(Math.random() * 1000)
        const content = this.newItem

        // update the front-end state immediately to make it feel snappy!
        this.items.push({ id, content })
        this.newItem = ''

        // sync it to the back-end behind the scenes
        axios.post(url('todo_items'), {
          content,
        }).then(response => {
          if (response.data.status == 'success') {
            // let user know sync was successful
            this.success('Successfully added a new task!')
            const item = response.data.item

            // update the id
            const index = _.findIndex(this.items, { id })
            this.$set(this.items, index, item)
            
            // record history
            this.recordHistory('You created the task "' + item.content + '"')
          }
        }).catch(error => {
          // oops! bring back previous state
          this.newItem = content

          // remove the added content since it wasn't synced
          const index = _.findIndex(this.items, { id })
          this.items.splice(index, 1)
          
          // let user know something went wrong
          this.error(error)
        })
      },

      removeItem (index, item) {
        // update the front-end immediately so it feels snappy!
        this.items.splice(index, 1)

        // sync it in the background
        axios.delete(url('todo_items/' + item.id)).then(response => {
          if (response.data.status == 'success') {
            this.success('Task Successfully Deleted!')
            this.recordHistory('You deleted the task "' + item.content + '"')
          }
        }).catch(error => {
          // oops! add back the item since it wasn't deleted in the back-end
          this.items.push(item)

          // let user know something went wrong
          this.error(error)
        })
      },

      recordHistory (content) {
        this.history.push({ content })
      }
    }
  }
</script>
