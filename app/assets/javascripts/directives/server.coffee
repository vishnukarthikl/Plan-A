@ServerError = ->
  restrict: 'A',
  require: '?ngModel',
  link: (scope, element, attrs, ctrl) ->
    element.on('change keyup', ->
      scope.$apply(->
        ctrl.$setValidity('server', true)));
