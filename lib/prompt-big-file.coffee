module.exports =

  activate: (state) ->

    @subscription = atom.workspace.observeTextEditors (item) ->
      if item.getText().length >= 1024 * 256
        item.setGrammar(atom.grammars.grammarForScopeName('text.plain.null-grammar'))
        atom.confirm
          message: 'Warning'
          detailedMessage: 'The file you are opening could cause Atom to stop responding.\nContinue will use a plain grammar.'
          buttons:
            Continue: ->
            Abort: -> item.destroy()

  deactivate: ->
    @subscription.dispose()
