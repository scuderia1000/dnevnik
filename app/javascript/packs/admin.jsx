import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import adminStore from '../stores/adminStore';
import TopBar from '../containers/TopBar';

class App extends Component {
    render() {
        return (
            <TopBar/>
        )
    }
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Provider store={adminStore}>
            <App />
        </Provider>,
        document.getElementById('app'),
    )
});
