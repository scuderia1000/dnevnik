import { SET_SCHOOL_TITLE } from '../constants/actionType'

let initState = {
    schoolTitle: ''
};

export default (state = initState, action) => {
    switch (action.type) {
        case SET_SCHOOL_TITLE: {
            return {
                ...state,
                schoolTitle: action.payload
            }
        }
        default:
            return state;
    }
}
