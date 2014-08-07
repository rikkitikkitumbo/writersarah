WriterSarah.controller "CatsController", ($scope, $http, Restangular, $stateParams) ->

  $scope.sortableOptions =
    stop: () ->
      $scope.make_article_order_array()


  $scope.make_article_order_array = () ->
    positions = []
    list = $scope.articles
    for g in list
      positions.push(g.id)
    console.log(positions)
    $scope.putOrder_array($scope.cat, positions)

  $scope.putOrder_array = (catt, order_array) ->
    cat = catt
    cat.order_array = order_array.toString()
    cat.put()

  $scope.getCat = () ->
    id = $scope.paramsId()
    Restangular.one('api/v1/cats', id).get().then (response) ->
      $scope.cat = response

  $scope.gettCats = () ->
    Restangular.all('api/v1/cats').getList().then (response) ->
      $scope.cats = response

  $scope.getTitle = () ->
    $scope.title = $stateParams.title

  $scope.paramsId = () ->
    switch
      when $stateParams.title == "Magazine"
        1
      when $stateParams.title == "Coorperate Copywright"
        2
      when $stateParams.title == "Novels"
        3

  $scope.getArticles = () ->
    id = $scope.paramsId()
    Restangular.one('api/v1/cats', id).getList('articles').then (response) ->
      $scope.articles = response

  $scope.getAllArticles = () ->
    Restangular.all('api/v1/allarticles').getList().then (response) ->
      $scope.allarticles = response


  $scope.clearArticle = () ->
    $scope.article = {}


  $scope.MakeCat_id = (article) ->
    switch
      when article.cat_title == "Magazine"
        article.cat_id = 1
      when article.cat_title == "Coorperate Copywright"
        article.cat_id = 2
      when article.cat_title == "Novels"
        article.cat_id = 3


  $scope.saveArticle = (article) ->
    article.cat_title = $stateParams.title
    $scope.MakeCat_id(article)
    Restangular.all('api/v1/allarticles').post(article).then ->
      Restangular.all('api/v1/allarticles').getList().then (response) ->
        new_article = response[0]
        $scope.articles.unshift(new_article)
        $scope.make_article_order_array()
        $scope.clearArticle()

  $scope.deleteArticle = (article) ->
    id = $scope.paramsId()
    if confirm('Are you sure you want to delete "' + article.title + '"?')
      indexx = $scope.articles.indexOf(article)
      $http.delete('api/v1/cats/' + id + '/articles/' + article.id).then ->
        $scope.articles.removeAt(indexx)
        console.log('deleted ' + indexx)

  $scope.editArticle = (article) ->
    $scope.article = article


  $scope.user_authenticated = () ->
    $scope.authenticated

  $scope.starts_with_http = (data) ->
    console.log(data)
    if data.substring(0, 7) != "http://"
      "make sure url starts with http://"


  $scope.putArticle = (article) ->
    $scope.MakeCat_id(article)
    article.cat_title = $stateParams.title
    article.put()


  $scope.putCat = (cat) ->
    cat.put().then ->
      $scope.cat = cat

