import { Theme } from '../superdry'
defaultTheme = new Theme
  wrapper:
    visibility: 'visible !important'
    font: "14px 'Helvetica Neue', Helvetica, Arial, sans-serif"
    lineHeight: '1.4em'
    background: '#f5f5f5'
    color: '#4d4d4d'
    minWidth: 230
    maxWidth: 550
    margin: '0 auto'
    fontSmoothing: 'antialiased'
    fontWeight: '300'

  app:
    background: '#fff'
    margin: '130px 0 40px 0'
    position: 'relative'
    boxShadow: '0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 25px 50px 0 rgba(0, 0, 0, 0.1)'

  header:
    _as: 'h1'
    position: 'absolute'
    top: -155
    width: '100%'
    fontSize: 100
    fontWeight: 100
    textAlign: 'center'
    color: 'rgba(175, 47, 47, 0.15)'
    textRendering: 'optimizeLegibility'

  toggleLabel:
    _as: 'label'
    display: 'none'
  edit:
    _as: 'input'
    position: 'relative'
    margin: 0
    width: '100%'
    fontSize: 24
    fontFamily: 'inherit'
    fontWeight: 'inherit'
    lineHeight: '1.4em'
    border: 0
    outline: 'none'
    color: 'inherit'
    padding: '6px'
    border: '1px solid #999'
    boxShadow: 'inset 0 -1px 5px 0 rgba(0, 0, 0, 0.2)'
    boxSizing: 'border-box'
    fontSmoothing: 'antialiased'
  newTodo:
    _as: '@edit'
    padding: '16px 16px 16px 60px'
    border: 'none'
    background: 'rgba(0, 0, 0, 0.003)'
    boxShadow: 'inset 0 -2px 1px rgba(0,0,0,0.03)'

  main:
    position: 'relative'
    zIndex: 2
    borderTop: '1px solid #e6e6e6'
    visibility: 'visible'
  'main.empty':
    _as: '@main'
    visibility: 'hidden'

  toggle:
    _as: 'input(checkbox)'
    position: 'absolute'
    outline: 'none'
    transform: 'rotate(90deg)'
    appearance: 'none'
    top: -55
    left: -12
    width: 60
    height: 34
    textAlign: 'center'
    border: 'none'
    '&:before':
      content: '"❯"'
      fontSize: 22
      color: '#e6e6e6'
      padding: '10px 27px 10px 27px'
    '&:checked:before':
      color: '#737373'

  list:
    _as: 'ul'
    margin: 0
    padding: 0
    listStyle: 'none'
  task:
    _as: 'li'
    position: 'relative'
    fontSize: 24
    borderBottom: '1px solid #ededed'
    '&:last-child':
      borderBottom: 'none'
    '&:hover button':
      display: 'block'
      color: '#af5b5e'
  'task.editing':
    _as: '@task'
    borderBottom: 'none'
    padding: 0
    '&:last-child':
      marginBottom: -1
  destroyButton:
    _as: 'button'
    display: 'none'
    position: 'absolute'
    top: 0
    right: 10
    bottom: 0
    width: 40
    height: 40
    margin: 'auto 0'
    fontFamily: 'inherit'
    fontSize: 30
    fontSmoothing: 'antialiased'
    fontWeight: 'inherit'
    color: '#cc9a9a'
    marginBottom: 11
    padding: 0
    border: 0
    background: 'none'
    verticalAlign: 'baseline'
    appearance: 'none'
    transition: 'color 0.2s ease-out'
    '&:after':
      content: '"×"'
    '&:hover':
      color: '#af5b5e'
  taskEdit:
    _as: '@edit'
    display: 'block'
    width: 506
    padding: '13px 17px 12px 17px'
    margin: '0 0 0 43px'
  taskToggle:
    _as: 'input(checkbox)'
    textAlign: 'center'
    width: 40
    height: 40
    background: 'none'
    position: 'absolute'
    top: 0
    bottom: 0
    margin: 'auto 0'
    border: 'none'
    appearance: 'none'
    '&:after':
      content: 'url(\'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="-10 -18 100 135"><circle cx="50" cy="50" r="50" fill="none" stroke="#ededed" stroke-width="3"/></svg>\')'
    '&:checked:after':
      content: 'url(\'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="-10 -18 100 135"><circle cx="50" cy="50" r="50" fill="none" stroke="#bddad5" stroke-width="3"/><path fill="#5dc2af" d="M72 25L42 71 27 56l-4 4 20 20 34-52z"/></svg>\')'
  entryLabel:
    _as: 'label'
    whiteSpace: 'pre-line'
    wordBreak: 'break-all'
    padding: '15px 60px 15px 15px'
    marginLeft: 45
    display: 'block'
    lineHeight: 1.2
    transition: 'color 0.4s'
  'entryLabel.completed':
    _as: '@entryLabel'
    color: '#d9d9d9'
    textDecoration: 'line-through'

  # footer
  footer:
    color: '#777'
    padding: '10px 15px'
    height: 20
    textAlign: 'center'
    borderTop: '1px solid #e6e6e6'
    '&:before':
        content: '""'
        position: 'absolute'
        right: 0
        bottom: 0
        left: 0
        height: 50
        overflow: 'hidden'
        boxShadow: """
          0 1px 1px rgba(0, 0, 0, 0.2),
          0 8px 0 -3px #f6f6f6,
          0 9px 1px -3px rgba(0, 0, 0, 0.2),
          0 16px 0 -6px #f6f6f6,
          0 17px 2px -6px rgba(0, 0, 0, 0.2) """
  counter:
    _as: 'span'
    float: 'left'
    textAlign: 'left'
    fontWeight: 300
  filters:
    right: 0
    left: 0
    position: 'absolute'
  filter:
    _as: 'a'
    color: 'inherit'
    margin: 3
    padding: '3px 7px'
    textDecoration: 'none'
    border: '1px solid transparent'
    borderRadius: 3
    '&:hover':
      borderColor: 'rgba(175, 47, 47, 0.1)'
  'filter.current':
    _as: '@filter'
    borderColor: 'rgba(175, 47, 47, 0.2)'
  clearButton:
    float: 'right'
    position: 'relative'
    lineHeight: '20px'
    textDecoration: 'none'
    cursor: 'pointer'
    position: 'relative'
    '&:hover':
      textDecoration: 'underline'

  info:
    margin: '65px auto 0'
    color: '#bfbfbf'
    fontSize: 10
    textShadow: '0 1px 0 rgba(255, 255, 255, 0.5)'
    textAlign: 'center'
  infoLine:
    lineHeight: 2
    display: 'block'
  infoLink:
    _as: 'a'
    color: 'inherit'
    textDecoration: 'none'
    fontWeight: 400
    '&:hover':
      textDecoration: 'underline'

export default defaultTheme
