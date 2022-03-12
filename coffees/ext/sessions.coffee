_root_path = document.body.getAttribute('data-root-path')

document.addEventListener 'keydown', (e) ->
  return true unless e.altKey and e.keyCode is 69
  oReq = new XMLHttpRequest()
  oReq.addEventListener 'load', ->
    validResponse = @status == 200

    out = '<div>'
    out += '<h2>Session list</h2>'
    if validResponse
      response = JSON.parse(@responseText)
      if response.sessions.length is 0
        out += "No current session for user #{response.user}"
      else
        out += '<ul>'
        for session in response.sessions
          path = "{_root_path}/session/#{session}"
          out += "<li><a href=\"{path}\">#{session}</a></li>"
        out += '</ul>'
    else:
      out += "Failed to fetch list of sessions"

    out += '</div>'

    popup.open out

  oReq.open("GET", _root_path + "/sessions/list.json")
  oReq.send()
  cancel e
