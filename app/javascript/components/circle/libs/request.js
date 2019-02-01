const baseURL = document.URL;

class Request {
  constructor() {
    this.get = (options) => {
      options.method = 'GET';
      this._request(options);
    }
  
    this.put = (options) => {
      options.method = 'PUT';
      this._request(options);
    }
  
    this.post = (options) => {
      options.method = 'POST';
      this._request(options);
    }
  
    this._request = (options) => {
      let requestUrl = baseUrl + options.url;
      $.ajax({
        url: requestUrl,
        method: options.method,
        data: options.data
      }).done((res) => {
        options.success && options.success(res);
      }).fail((res) => {
        options.fail && options.fail(res);
      }).always((res) => {
        options.complete && options.complete(res);
      })
    }
  }
}

export default new Request;