import React from "react"
import PropTypes from "prop-types"
import api from '../libs/api';

class Cart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ui: { pageInited: false }
    }
  }

  componentDidMount() {
    api.getPagesCart({
      success: (res) => {
        this.setState({
          ui: { pageInited: true }
        })
      }
    })
  }

  render() {
    return (
      <div>
        { this.state.ui.pageInited ? 'pageInited!' : 'loading' }
      </div>
    );
  }
}

export default Cart;
