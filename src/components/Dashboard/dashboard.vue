<template>
    <div id="dashboard">
        <ul class="collection with-header">
            <li class="collection-header">
                <h4>Employees </h4>
            </li>

            <li v-for="employee in employees" v-bind:key="employee.id" class="collection-item">
            <div class="chip">
                {{employee.dept}}
            </div>
            {{employee.employeeId}}:  {{employee.name}}


            <router-link class="secondary-content" v-bind:to="{name: 'view-employee', params: {employeeId: employee.employeeId}}">
                <i class="fa fa-eye"></i>
            </router-link>
            </li>
        </ul>

        <div class="fixed-action-btn">
            <router-link to="/new" class="btn-floating btn-large red">
                <i class="fa fa-plus">

                </i>
            </router-link>
        </div>
    </div>
</template>


<script>
import db from '../Firebase/firebaseInit'
export default {
    name: "dashboard",
    data () {
        return {
            employees: []
        }
    },
    created () {
        db.collection('employees').orderBy('dept').get()
        .then(querySnapShoot => {
            querySnapShoot.forEach(doc => {
                console.log(doc.data())
                const data = {
                    id: doc.data().id,
                    employeeId: doc.data().employeeId,
                    name: doc.data().name,
                    position: doc.data().position,
                    dept: doc.data().dept
                }
                this.employees.push(data)
            });
        })
    }
}
</script>
