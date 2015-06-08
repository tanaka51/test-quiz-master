_.extend Marionette.Renderer,

  lookups: ["modules/"]

  render: (template, data) ->
    @getTemplate(template)(data)

  getTemplate: (template) ->
    for lookup in @lookups
      path = lookup + template
      return JST[path] if JST[path]
