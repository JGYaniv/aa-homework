import React from 'react';
// this.state === {title: "1", company: "A", ...}
const Job = ({title, company, type, location, description, info}) => {
  let color = "red";
  if (type === "Full Time") {
    color = "green";
  }

  return (
    <li>
      <ul>
        <li><b>Title: </b>{title}</li>
        <li><b>Company: </b >{company} - <span className={color}>{type}</span></li>
        <li><b>Location: </b >{location}</li>
        <li><b>Description: </b >{description}</li>
        <li><a href={info}>More Info</a></li>
      </ul>
    </li>
  );
};

export default Job;
