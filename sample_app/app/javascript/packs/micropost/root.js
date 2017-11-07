import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter, Route } from 'react-router-dom'
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
              <Micropost key={ d.id } data={ d } />
          ))
        }
      </div>
    )
  }
}

ReactDOM.render((
  <BrowserRouter>
    <Route path="/" component={ Microposts } />
  </BrowserRouter>
), document.getElementById('micropost-root'))
