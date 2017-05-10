import React, { Component } from 'react'
import PropTypes from 'prop-types'

/*
const ThisClass = ({prop1, prop2}) => (
  <div key={prop1}>{ prop2 }</div>
)
// or:
*/

export default class ThisClass extends Component {
  // componentWillMount () { } // Only for server-side rendering

  constructor (props) {
    super(props)

    this.bindInstanceMethods('methodName1', 'methodName2')

    // this.state = {}
  }

  bindInstanceMethods (...methods) {
    methods.forEach((method) => { this[method] = this[method].bind(this) })
  }

  componentDidMount () {
  }

  componentWillReceiveProps (nextProps) {
  }

  shouldComponentUpdate (nextProps, nextState) {
    return false
  }

  componentWillUpdate (nextProps, nextState) {
  }

  // Consider hitting m-r in Vim to set bookmark
  render () {
    return (
      <div>
      </div>
    )
  }

  componentDidUpdate (prevProps, prevState) {
  }

  componentWillUnmount () {
  }
}

ThisClass.propTypes = {
  string: PropTypes.string.isRequired,
  initialValue: PropTypes.number,
  type: PropTypes.oneOf(['enum1', 'enum2'])
}

ThisClass.defaultProps = {
  initialValue: 0
}
