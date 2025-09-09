const cds = require('@sap/cds')
const { default: axios } = require('axios')
const { GET, POST, DELETE, PATCH, expect } = cds.test(__dirname + '../../')

axios.defaults.auth = { username: 'admin' };

jest.setTimeout(600)

describe('Test The GET Endpoints', () => {
    it('Select data should work when data is requested', async () => {
        const { data } = await GET`/odata/v4/status/StatusOverview`
        expect(data).to.be.an('object')
    })
    it('Select data with expand entity should retrieve data requested', async () => {
        const { data } = await GET`/odata/v4/status/StatusOverview?$expand=comment`
        expect(data).to.be.an('object')
    })
})

describe('Test The POST Endpoints', () => {
    describe('Create a status overview with admin rights should', () => {
        it('Create a status ', async () => {
            const { status, statusText } = await POST(`/odata/v4/status/StatusOverview`, {
                status_code: 'Success',
                component: 'Test component',
                comment: {
                    comment: 'Test comment'
                }
            })
            expect(status).to.equal(201)
            expect(statusText).to.equal('Created')
        })
    })
})
