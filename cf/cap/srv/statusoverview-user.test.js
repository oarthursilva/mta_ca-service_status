const cds = require('@sap/cds')
const { default: axios } = require('axios')
const { GET, POST, DELETE, PATCH, expect } = cds.test(__dirname + '../../')

axios.defaults.auth = { username: 'user' };

jest.setTimeout(600)

describe('Test The GET Endpoints', () => {
    it('Select data should retrieve data requested', async () => {
        const { data } = await GET`/odata/v4/status/StatusOverview`
        expect(data).to.be.an('object')
    })
    it('Select data with expand entity should retrieve data requested', async () => {
        const { data } = await GET`/odata/v4/status/StatusOverview?$expand=comment`
        expect(data).to.be.an('object')
    })
})

describe('Test The POST Endpoints', () => {
    describe('Create a status overview with user rights should', () => {
        it('Fail due to missing rights', async () => {
            try {
                await POST(`/odata/v4/status/StatusOverview`);
            } catch (error) {
                expect(error.response.status).to.equal(405)
                expect(error.response.data.error.message).to.include('read-only')
            }
        })
    })
})
