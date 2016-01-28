import React, { PropTypes } from 'react'

/*
const ThisClass = ( props ) => (
  <ThisClass key={ props.foo } />
)
// or:
*/

export default class ThisClass extends React.Component {

  constructor(props) {
    super(props)
    //this.bindInstanceMethods( 'methodName1', 'methodName2' )

    //this.state = {}
  }

  bindInstanceMethods( ...methods ) {
    methods.forEach(
      ( method ) => this[ method ] = this[ method ].bind( this )
    )
  }

  /*
  // https://facebook.github.io/react/docs/component-specs.html
  componentWillMount() { }
  componentDidMount() { }
  componentWillReceiveProps( nextProps ) { }
  shouldComponentUpdate( nextProps, nextState ) { return false }
  componentWillUpdate( nextProps, nextState ) { }
  componentDidUpdate( prevProps, prevState ) { }
  componentWillUnmount() { }
  */

  // Consider hitting m-r in Vim to set bookmark
  render() {
    return (
      <div>
      </div>
    )
  }
}

/*
ThisClass.propTypes = {
  initialValue: PropTypes.number,
  type: PropTypes.oneOf( ['enum1', 'enum2'] )
}
*/
// ThisClass.defaultProps = { initialValue: 0 }
