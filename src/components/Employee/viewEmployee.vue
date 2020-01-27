<template>
    <div id="view-employee">
        <ul class="collection with-header">
            <li class="collection-header">
                <h4>{{name}}</h4>
            </li>

            <li class="collection-item">Employee Id Number: {{employeeId}}</li>
            <li class="collection-item">Department: {{dept}}</li>
            <li class="collection-item">Position: {{position}}</li>
        </ul>

        <router-link to="/" class="btn grey">Back</router-link>
        <button @click="deleteEmployee" class="btn red">
            Delete
        </button>

        <div class="fixed-action-btn">
            <router-link v-bind:to="{name: 'edit-employee', params: {employeeId}}" class="btn-floating btn-large red">
                <i class="fa fa-pencil">

                </i>
            </router-link>
        </div>
    </div>
</template>


<script>
import db from '../Firebase/firebaseInit'
export default {
    name: "view-employee",
    data () {
        return {
            employeeId: null,
            name: null,
            dept: null,
            position: null
        }
    },

    beforeRouteEnter(to, from, next) {
        db.collection('employees')
        .where('employeeId', '==', to.params.employeeId)
        .get()
        .then(querySnapShoot => {
            querySnapShoot.forEach(doc => {
                console.log(doc.data())
                next(vm => {
                    vm.employeeId = doc.data().employeeId
                    vm.name = doc.data().name
                    vm.position = doc.data().position
                    vm.dept = doc.data().dept
                })
            })
        })
    },

    watch: {
        '$route': 'fetchData'
    },

    methods: {
        fetchData() {
            db.collection('employees')
            .where('employeeId', '==', this.$route.params.employeeId)
            .get()
            .then(querySnapShoot => {
                querySnapShoot.forEach(doc => {
                    this.employeeId = doc.data().employeeId
                    this.name = doc.data().name
                    this.dept = doc.data().dept
                    this.position = doc.data().position
                })
            })
        },

        deleteEmployee() {
            if (confirm("Are you sure ?")){
                db.collection('employees')
                .where('employeeId', '==', this.$route.params.employeeId)
                .get()
                .then(querySnapShoot => {
                    querySnapShoot.forEach(doc => {
                        doc.ref.delete()
                        this.$router.push('/')
                    })
                })
            }
        }
    }
}
</script>
