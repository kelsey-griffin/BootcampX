const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// pool.query(`
// SELECT students.id, students.name AS student_name, cohort_id, cohorts.name AS cohort_name
// FROM students
// JOIN cohorts ON cohort_id = cohorts.id
// LIMIT 5;
// `)
// .then(res => {
//   res.rows.forEach(user => {
//     console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
//   })
// }).catch(err => console.error('query error', err.stack));

// using PostgreSQL queries
// pool.query(`
// SELECT students.id, students.name AS student_name, cohort_id, cohorts.name AS cohort_name
// FROM students
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${process.argv[2]}%'
// LIMIT ${process.argv[3] || 5};
// `)
// .then(res => {
//   res.rows.forEach(user => {
//     console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
//   })
// }).catch(err => console.error('query error', err.stack));

//using parameterized query
const queryString = `
SELECT students.id, students.name AS student_name, cohort_id, cohorts.name AS cohort_name
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const limit = process.argv[3] || 5;
const cohortName =process.argv[2];

const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })
}).catch(err => console.error('query error', err.stack));