export default {
  methods: {
    error (error) {
      let message = ''

      if (typeof error == 'string') {
        message = error
      } else if (error && error.response) {
        if (error.response.data.errors) {
          _.forEach(error.response.data.errors, (dataItem) => {
            _.forEach(dataItem, (data) => {
              message += data + ' \n'
            })
          })
        } else {
          message = error.response.data.message
        }
      } else if (error.message) {
        message = error.message
      }

      this.$toast.open({
        message,
        type: 'is-danger'
      })
    },

    success (message) {
      this.$toast.open({
        message,
        type: 'is-success',
      })
    }
  },
}
