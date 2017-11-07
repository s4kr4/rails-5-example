import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios'

import Micropost from './Micropost'

class Microposts extends Component {
  constructor() {
    super()

    this.state = {
      data: []
    }
  }

  componentDidMount() {
    axios.get('/timeline')
      .then(res => {
        this.setState({
          data: res.data
        })
      })
  }

  render() {
    return (
      <div className="microposts">
        {
          this.state.data.map(d => (
              <Micropost data={ d } />
          ))
        }
      </div>
    )
  }
}

ReactDOM.render((
  <Microposts />
), document.getElementById('micropost-root'))
