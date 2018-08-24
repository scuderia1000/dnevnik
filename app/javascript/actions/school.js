import { schoolData } from '../services/fetchers'
import { SET_SCHOOL_TITLE } from '../constants/actionType'

export const setSchoolTitle = (title) => ({
    type: SET_SCHOOL_TITLE,
    payload: title
});


export const fetchSchoolData = () => {
    return (dispatch) => {
        schoolData()
            .then(res => dispatch(setSchoolTitle(res.school.title)))
    }
};