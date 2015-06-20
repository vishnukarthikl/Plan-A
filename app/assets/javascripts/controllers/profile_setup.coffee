@ProfileSetupCtrl = ($scope, UserService) ->
  div = $('#data')[0]
  $scope.user = {}
  $scope.errors = {};
  $scope.user.id = div.getAttribute("data-user-id")

  $scope.saveUser = () ->
    user = $scope.user
    success = (result) ->


    error = (result) ->
      angular.forEach(result.data, (errors, field) ->
        $scope.userForm[field].$setValidity('server', false);
        $scope.errors[field] = errors.join(', ');
      )

    UserService.update(user).$promise.then(success, error)