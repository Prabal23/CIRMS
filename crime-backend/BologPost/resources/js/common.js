import {
    mapActions,
    mapGetters
} from 'vuex';
export default {
    data() {
        return {
            siteUri: 'http://Blogpost.localhost/',
            selectdata: '',
        }
    },
    computed: {
        ...mapGetters({
            tagInfo: 'getFlag',
        }),
    },
    methods: {
        /**
         * 
         * @param {*} method, call method
         * @param {*} url , api url
         * @param {*} dataObj, payload
         */
        async callApi(method, url, dataObj) {
            try {

                let data = await axios({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    method: method,
                    url: '/app/' + url,
                    data: dataObj
                })
                return data

            } catch (e) {

                return e.response
            }
        },

        i(msg, i = 'Hey!') {
            this.$Notice.info({
                title: i,
                desc: msg
            });
        },
        s(msg, i = 'Great!') {
            this.$Notice.success({
                title: i,
                desc: msg
            });
        },
        w(msg, i = 'Hi!') {
            this.$Notice.warning({
                title: i,
                desc: msg
            });
        },
        e(msg, i = 'Oops!') {
            this.$Notice.error({
                title: i,
                desc: msg,

            });
        },
        swr() {
            this.$Notice.error({
                title: 'Oops',
                desc: 'Something went wrong, please try again later'
            });
        },

        // message 

        ns(title) {
            this.$Message.success(title);
        },
        ni(title) {
            this.$Message.info(title);
        },
        nw(title) {
            this.$Message.warning(title);
        },
        ne(title) {
            this.$Message.error(title);
        },
        nswr() {
            this.$Message.error('Something went wrong, please try again later');
        },
        nl(t) {
            const msg = this.$Message.loading({
                content: t,
                duration: 0
            });
            return msg
        },
        uo(t) {
            const msg = this.$Message.info({
                content: t,
                closable: true,
                duration: 2

            });
            return msg
        },
        newp(title) {
            this.$Message.info({
                content: title,
                duration: 2,
                closable: true
            });
        },
        sendWsMsgAlertFromClient(id) {
            const ws = adonis.Ws()
            ws.connect()
            const chat = ws.subscribe(`noti:${id}`)

            chat.on('ready', () => {
                const data = {
                    type: 501,
                }
                chat.emit('message', data)
            })
        },
        async clearTempFile() {
            const res = await this.callApi('post', '/app/clear_temp')
        },
    }
}