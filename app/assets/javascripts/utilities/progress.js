document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress-bar');

  if (progress) {
    var questionNumber = progress.dataset.questionNumber;
    var countOfQuestions = progress.dataset.countOfQuestions;

    var resultPercent = ((100 * questionNumber) / countOfQuestions) + '%';
    progress.style.width = resultPercent;
  };
});
