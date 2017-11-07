import React, { Component } from 'react'
import ReactDOM from 'react-dom'

export default class Micropost extends Component {
  render() {
    return (
      <div className='micropost' key={ this.props.data.id }>
        { this.props.data.content }
      </div>
    )
  }
}
