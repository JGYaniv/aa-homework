const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type){
    case "SWITCH_LOCATION": 
      return {
        action: action.city,
        jobs: action.job
      };
    default: 
      return state;
  }
};


export default reducer;
