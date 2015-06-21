@ProfileSetupCtrl = ($scope, UserService) ->

  $scope.refresh = () ->
    $scope.form = {}
    div = $('#data')[0]
    $scope.user = {}
    $scope.errors = {};
    $scope.user.id = div.getAttribute("data-user-id")
    $scope.user= UserService.get({id: $scope.user.id})
    if !$scope.user.name
      $scope.setupFor = "user"
    else
      $scope.setupFor = "group"

  $scope.refresh()

  $scope.saveUser = () ->
    user = $scope.user
    success = (result) ->
      $scope.setupFor = "group"

    error = (result) ->
      angular.forEach(result.data, (errors, field) ->
        $scope.form.user[field].$setValidity('server', false);
        $scope.errors[field] = errors.join(', ');
      )

    UserService.update(user).$promise.then(success, error)