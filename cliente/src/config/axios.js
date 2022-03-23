import axios from 'axios'

const clienteAxios = axios.create({
    baseURL : 'https://peaceful-harbor-71878.herokuapp.com'
});

export default clienteAxios;