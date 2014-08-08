WriterSarah.controller "PublicController", ["$scope", "$http", "Restangular", "$stateParams", ($scope, $http, Restangular, $stateParams) ->

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

  $scope.user_authenticated = () ->
    $scope.authenticated

]