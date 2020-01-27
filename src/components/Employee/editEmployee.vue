<template>
    <div id="edit-employee">
        <h3>Edit Employee</h3>
        <div class="row">
            <form @submit.prevent="updateEmp" class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input disabled type="text" v-model="employeeId" required>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="name" required>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="dept" required>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="position" required>
                    </div>
                </div>
                <button type="submit" class="btn">Submit</button>
                <router-link to="/" class="btn grey">Cancel</router-link>
            </form>
        </div>
    </div>
</template>


<script>
import db from '../Firebase/firebaseInit'
export default {
    name: "edit-employee",
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

        updateEmp() {
            db.collection('employees')
            .where('employeeId', '==', this.$route.params.employeeId)
            .get()
            .then(querySnapShoot => {
                querySnapShoot.forEach(doc => {
                    doc.ref.update({
                        employeeId: this.employeeId,
                        name: this.name,
                        dept: this.dept,
                        position: this.position
                    }).then(() => {
                        this.$router.push({name: 'view-employee', params: {employeeId: this.employeeId}})
                    })
                })
            })
        }
    }
}
</script>
