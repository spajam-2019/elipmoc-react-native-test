import Axios from "axios";
import Env from './env'

export class ApiClient{
    constructor(){
        this.axios=Axios.create({
            baseURL:Env.BACK_URL+"/v1"
        })
    }

    //Githubリポジトリ検索のリクエスト
    async FindRepositories(keyword,page=1){
        return (
            await this.axios.get("github_repositories/find_repositories",{params:{keyword,page}})
            ).data;
    }
}