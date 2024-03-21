abstract class BaseApiService {
  private readonly api: string;

  protected constructor() {
    this.api = "http://localhost:8080/api";
  }

  protected getApi(endpoint: string) {
    console.log("ENDPOINT", endpoint, this.api);
    return `${this.api}${endpoint.startsWith("/") ? "" : "/"}${endpoint}`;
  }
}

export default BaseApiService;
