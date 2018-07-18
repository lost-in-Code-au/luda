import 'babel-polyfill';
import React from 'react'
import ReactDOM from 'react-dom'
// import environment from '../shared/environment';
import { QueryRenderer, graphql } from 'react-relay';

class Hello extends React.Component {
	render() {
		return (<div>Hello {this.props.name}!</div>)
	}
}
document.addEventListener("DOMContentLoaded", e => {
  	ReactDOM.render(<Hello name="React" />, document.body.appendChild(document.createElement('div')))
})