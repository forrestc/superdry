import { get } from 'lodash'
import React from 'react'
import reactKup from 'react-kup'
import { render } from 'react-dom'
import { AppContainer } from 'react-hot-loader'

import TodoMvc from './TodoMvc'


element = () ->
  reactKup (k) ->
    k.build AppContainer, ->
      k.div ->
        k.build TodoMvc

render(element(), document.getElementById('root'))
