import {
  action, computed, configure, extendObservable, observe, toJS,
  isObservableArray
} from 'mobx'

import React, { Component as ReactComponent } from 'react';
import { observer } from 'mobx-react';
import styled from 'styled-jss'
import { capitalize, forEach, isObject, merge, omit } from 'lodash'

configure({ enforceActions: 'never' })

function reactKup(callback) {
  const stack = [[]]

  const normalizeChildren = (inputs) => {
    let outputs = []
    inputs.forEach(input => {
      if (React.isValidElement(input)) {
        outputs.push(input)
      } else if (typeof input === 'function') {
        stack.unshift([])
        input()
        outputs = outputs.concat(stack.shift())
      } else if (Array.isArray(input)) {
        outputs = outputs.concat(normalizeChildren(input))
      } else if (input != null && input !== false) {
        outputs.push(input)
      }
    })
    return outputs
  }

  const build = (type, config, ...children) => {
    if (React.isValidElement(type)) {
      stack[0].push(type)
      return type
    }
    const isValidConfig = config !== null && typeof config === 'object' &&
      !React.isValidElement(config) && !Array.isArray(config)
    if (!isValidConfig) {
      if (config !== undefined) children.unshift(config)
      config = {}
    }
    const normalized = normalizeChildren(children)
    const element = React.createElement(type, config, ...normalized)
    stack[0].push(element)
    return element
  }

  const kup = { build, element: () => stack[0][0] || null }
  if (callback != null) {
    callback(kup)
    return kup.element()
  }
  return kup
}

export class Store {
  constructor(load) {
    let obj = {}
    if (typeof(this.setup) === 'function') {
      obj = this.setup(load)
    }

    let observableAttrs = []
    let extendObj = {}

    for (let attrName in obj) {
      let val = obj[attrName]
      if (typeof(val) === 'function') {
        // MobX 5: use getter syntax for computed properties
        const fn = val
        Object.defineProperty(extendObj, attrName, {
          get: fn,
          enumerable: true,
          configurable: true
        })
      } else {
        observableAttrs.push(attrName)
        extendObj[attrName] = val
      }
    }
    const observable = extendObservable(this, extendObj)

    let loading = false
    if (typeof(this.load) === 'function') {
      const fn = () => {
        loading = true
        this.load().then( () => {
          loading = false
        })
      }
      fn.bind(this)()
    }

    if (this.onUpdate) {
      observe(observable, this.onUpdate.bind(this))
    }
    forEach(observableAttrs, (attrName) => {
      let attr = observable[attrName]

      let fnUpdate = 'on' + capitalize(attrName) + 'Update'
      if (this[fnUpdate]) {
        const fn = () => {
          if (!loading) this[fnUpdate]()
        }
        observe(attr, fn.bind(this))
      }

      if (isObservableArray(attr)) {
        let fnCreate = 'on' + capitalize(attrName) + 'Create'
        if (this[fnCreate]) {
          const fn = (change) => {
            if (!loading) {
              if ((change.type === 'splice') && (change.added[0]))
                this[fnCreate](toJS(change.added[0]))
            }
          }
          observe(observable[attrName], fn.bind(this))
        }

        let fnDelete = 'on' + capitalize(attrName) + 'Delete'
        if (this[fnDelete]) {
          const fn = (change) => {
            if (!loading) {
              if ((change.type === 'splice') && (change.removed[0]))
                this[fnDelete](toJS(change.removed[0]))
            }
          }
          observe(observable[attrName], fn.bind(this))
        }
      }
    })
  }

  json(obj) {
    return toJS(obj || this)
  }

  action(fn) {
    return action(fn)
  }
}

export class Theme {
  constructor(components) {
    this.coms = {}
    for (let name in components) {
      const def = components[name]
      let m = name.match(/(\w+)\.(\w+)/)
      if (m) def['extends'] = m[1]

      const base = def['extends']
      let elem = 'div'
      let defaultArgs = {}
      if (typeof(base) === 'string') {
        elem = base
      } else if (typeof(base) == 'object') {
        if (base.element) elem = base.element
        defaultArgs = omit(base, 'element')
      }
      this.define(name, elem, omit(def, 'extends'), defaultArgs)
    }
  }

  define(name, base, css, defaultArgs) {
    if (this.coms[base]) base = this.coms[base]

    const root = isObject(base) ? base.root : base
    if (isObject(base)) {
      css = merge(base.css, css)
    }
    this.coms[name] = {
      root: root,
      base: isObject(base) ? base.name : base,
      name: name,
      css: css,
      defaultArgs: merge(defaultArgs, base.defaultArgs),
      component: styled(root)(css)
    }
  }

  apply(fn) {
    const renderFn = function(v) {
      for (let [name, com] of Object.entries(this.coms)) {
        v[name] = (...args) => {
          if (com.root === 'input' && isObject(args[0])) {
            const attrs = args[0]
            if (attrs.onEnter) {
              attrs.onKeyPress = function (e) {
                if (e.which === 13) attrs.onEnter()
              }
            }

            if (attrs.onArrowDown || attrs.onArrowUp || attrs.onTab) {
              attrs.onKeyDown = function (e) {
                if (attrs.onArrowDown && e.which === 40) {
                  attrs.onArrowDown()
                  e.preventDefault()
                } else if (attrs.onArrowUp && e.which === 38) {
                  attrs.onArrowUp()
                  e.preventDefault()
                } else if (attrs.onTab && e.which === 9) {
                  attrs.onTab()
                  e.preventDefault()
                }
              }
            }

            if (attrs.onInput) {
              attrs.onChange = function (e) {
                attrs.onInput(e.target.value)
              }
            }

            args[0] = merge(com.defaultArgs, omit(attrs, ['onEnter', 'onInput']))
          }
          v.build(com.component, ...args)
        }
      }

      v.with = (name, state) => {
        for (let [key, value] of Object.entries(state)) {
          if (value) return v[name + '.' + key]
        }
        return v[name]
      }

      v.com = v.build
      fn(v)
    }.bind(this)

    return reactKup(renderFn)
  }
}

export class Component extends ReactComponent {
  constructor(props) {
    super(props)
    // Apply observer to the concrete subclass on first instantiation.
    // observer() mutates the class prototype in-place so all subsequent
    // instances of the same subclass are already reactive.
    const SubClass = this.constructor
    if (!SubClass._mobxObserved && SubClass !== Component && SubClass.prototype.render) {
      SubClass._mobxObserved = true
      observer(SubClass)
    }
  }

  initState(obj) {
    this.state = new Store(obj)
  }
}
