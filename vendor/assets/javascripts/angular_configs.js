var WriterSarah;

WriterSarah = void 0;

WriterSarah = angular.module("WriterSarah", ["restangular", "ui.router", "xeditable", "ui.sortable", "ngAnimate"]);

WriterSarah.config([
    "$httpProvider", function($httpProvider) {
        $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content");
        return $httpProvider.defaults.headers.common.Accept = "application/json";
    }
]);

WriterSarah.run(function(editableOptions) {
    return editableOptions.theme = "bs3";
});