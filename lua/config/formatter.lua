local formatter = require('formatter')

formatter.setup({
  filetype = {
    python = {
       function()
          return {
            exe = "black",
            args = {"--quiet"},
            stdin = true
          }
        end
    },
  }
})
