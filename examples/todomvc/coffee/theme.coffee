import { Theme } from 'superdry'
defaultTheme = new Theme
  wrapper:
    visibility: 'visible !important'
    font: '14px "Helvetica Neue", Helvetica, Arial, sans-serif'
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
    extends: 'h1'
    position: 'absolute'
    top: -155
    width: '100%'
    fontSize: 100
    fontWeight: 100
    textAlign: 'center'
    color: 'rgba(175, 47, 47, 0.15)'
    textRendering: 'optimizeLegibility'

  toggleLabel:
    extends: 'label'
    display: 'none'
  edit:
    extends:
      element: 'input'
      autoFocus: true
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
    extends: 'edit'
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
    visibility: 'hidden'

  toggle:
    extends:
      element: 'input'
      type: 'checkbox'
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
    extends: 'ul'
    margin: 0
    padding: 0
    listStyle: 'none'
  task:
    extends: 'li'
    position: 'relative'
    fontSize: 24
    borderBottom: '1px solid #ededed'
    '&:last-child':
      borderBottom: 'none'
    '&:hover button':
      display: 'block'
      color: '#af5b5e'
  'task.editing':
    borderBottom: 'none'
    padding: 0
    '&:last-child':
      marginBottom: -1
  destroyBtn:
    extends: 'button'
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
    extends: 'edit'
    display: 'block'
    width: 506
    padding: '13px 17px 12px 17px'
    margin: '0 0 0 43px'
  taskToggle:
    extends:
      element: 'input'
      type: 'checkbox'
    width: 40
    height: 40
    position: 'absolute'
    top: 0
    bottom: 0
    margin: 'auto 0'
    border: 'none'
    appearance: 'none'
    background: 'none'
    opacity: 0

  entryLabel:
    extends: 'label'
    color: '#484848'
    wordBreak: 'break-all'
    padding: '15px 15px 15px 60px'
    display: 'block'
    fontWeight: 400
    lineHeight: 1.2
    transition: 'color 0.4s'
    backgroundImage: 'url("data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2240%22%20height%3D%2240%22%20viewBox%3D%22-10%20-18%20100%20135%22%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%2250%22%20fill%3D%22none%22%20stroke%3D%22%23949494%22%20stroke-width%3D%223%22%2F%3E%3C%2Fsvg%3E")'
    backgroundRepeat: 'no-repeat'
    backgroundPosition: '0 center'

  'entryLabel.completed':
    color: '#949494'
    textDecoration: 'line-through'
    backgroundImage: 'url("data:image/svg+xml;utf8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2240%22%20height%3D%2240%22%20viewBox%3D%22-10%20-18%20100%20135%22%3E%3Ccircle%20cx%3D%2250%22%20cy%3D%2250%22%20r%3D%2250%22%20fill%3D%22none%22%20stroke%3D%22%2359A193%22%20stroke-width%3D%223%22%2F%3E%3Cpath%20fill%3D%22%233EA390%22%20d%3D%22M72%2025L42%2071%2027%2056l-4%204%2020%2020%2034-52z%22%2F%3E%3C%2Fsvg%3E")'

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
        boxShadow: '
          0 1px 1px rgba(0, 0, 0, 0.2),
          0 8px 0 -3px #f6f6f6,
          0 9px 1px -3px rgba(0, 0, 0, 0.2),
          0 16px 0 -6px #f6f6f6,
          0 17px 2px -6px rgba(0, 0, 0, 0.2)'
  counter:
    extends: 'span'
    float: 'left'
    textAlign: 'left'
    fontWeight: 300
  filters:
    right: 0
    left: 0
    position: 'absolute'
  filter:
    extends: 'a'
    color: 'inherit'
    margin: 3
    padding: '3px 7px'
    textDecoration: 'none'
    border: '1px solid transparent'
    borderRadius: 3
    '&:hover':
      borderColor: 'rgba(175, 47, 47, 0.1)'
  'filter.current':
    borderColor: 'rgba(175, 47, 47, 0.2)'
  clearBtn:
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
    extends: 'a'
    color: 'inherit'
    textDecoration: 'none'
    fontWeight: 400
    '&:hover':
      textDecoration: 'underline'

export default defaultTheme
