import { createStore, applyMiddleware, combineReducers } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';
import schoolReducer from '../reducers/schoolReducer';

const rootReducer = combineReducers({
    school: schoolReducer
});

export default createStore(
    rootReducer,
    composeWithDevTools(
        applyMiddleware(thunk)
    )
)

