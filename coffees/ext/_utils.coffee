getRootPath = () ->
  rootPath = document.body.getAttribute('data-root-path')
  rootPath = rootPath.replace(/^\/+|\/+$/g, '')
  if rootPath.length
    rootPath = "/#{rootPath}"
  rootPath

getDefaultTheme = () ->
  document.body.getAttribute('data-default-theme')

getCurrentTheme = () ->
  localStorage?.getItem('theme')

setDefaultTheme = () ->
  currentTheme = getCurrentTheme()
  defaultTheme = getDefaultTheme()
  themeName = "#{getRootPath()}/theme/#{defaultTheme}/style.css"
  set_theme themeName if defaultTheme and not currentTheme