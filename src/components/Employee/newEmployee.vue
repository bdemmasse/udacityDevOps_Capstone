<template>
    <div id="new-employee">
        <h3>New Employee</h3>
        <div class="row">
            <form @submit.prevent="saveEmp" class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="employeeId" required>
                        <label for="employeeId">Employee ID#</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="name" required>
                        <label for="employeeId">Name</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="dept" required>
                        <label for="employeeId">Department</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" v-model="position" required>
                        <label for="employeeId">Position</label>
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
    name: "new-employee",
    data () {
        return {
            employeeId: null,
            name: null,
            dept: null,
            position: null
        }
    },

    methods: {
        saveEmp() {
            db.collection('employees').add({
                employeeId: this.employeeId,
                name: this.name,
                dept: this.dept,
                position: this.position
            }).then(docRef => this.$router.push('/')).catch(err => console.log(err))
        }
    }
}
</script>
