import React, { Component } from 'react';
import { connect } from 'react-redux';
import SchoolTitle from '../components/SchoolTitle'
import { FETCH_SCHOOL_DATA } from '../constants/actionType'
import { fetchSchoolData } from '../actions/school'

class TopBar extends Component {

    componentDidMount() {
        this.props.fetchSchoolData();
    }

    render() {
        const { school } = this.props;
        return (
            <SchoolTitle title={school.schoolTitle}/>
        )
    }
}

export default connect(
    (state) => ({
        school: state.school,
    }),
    {
        fetchSchoolData
    }
    /*dispatch => ({
        fetchSchoolData: () => {
            dispatch({
                type: FETCH_SCHOOL_DATA
            })
        }
    })*/
)(TopBar)