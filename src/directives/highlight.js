import Vue from 'vue'
import hljs from 'highlight.js/lib/highlight'
import crystal from 'highlight.js/lib/languages/crystal'
import shell from 'highlight.js/lib/languages/shell'
import plaintext from 'highlight.js/lib/languages/plaintext'

hljs.registerLanguage('crystal', crystal)
hljs.registerLanguage('shell', shell)
hljs.registerLanguage('plaintext', plaintext)

Vue.directive('highlight', {
  deep: true,
  bind: function (el, binding) {
    let targets = el.querySelectorAll('code')

    targets.forEach((target) => {
      if (binding.value) {
        target.textContent = binding.value
      }

      hljs.highlightBlock(target)
    })
  },
  componentUpdated: function (el, binding) {
    let targets = el.querySelectorAll('code')

    targets.forEach((target) => {
      if (binding.value) {
        target.textContent = binding.value
        hljs.highlightBlock(target)
      }
    })
  }
})
