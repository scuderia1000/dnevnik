
export const schoolData = () => {
    return fetch('api/school')
        .then(res => res.json())
};