<div class="row">
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'blue', $count['jobs'], 'Total Jobs', 'fa fa-gear', 'job/post'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'purple', $count['active_jobs'], 'Active JobS', 'fa fa-gear', 'job/post'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'red', $count['closed_jobs'], 'In Active JobS', 'fa fa-gear', 'job/post'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box','yellow', $count['on_hold_jobs'], 'On Hold JobS', 'fa fa-gear', 'job/post'); ?>
    </div>
    <div class="col-md-6 bg-gray-light">
        <canvas id="jobTrendChart" width="300" height="300"></canvas>
    </div>
	<div class="col-md-6 bg-gray-light">
        <canvas id="jobOpenTrendChart" width="300" height="300"></canvas>
    </div>
</div>

<div class="row">
    <div class="col-md-2">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['hiring_managers'], 'Hiring Managers', 'fa fa-users', 'hiring_managers'); ?>
    </div>
    <div class="col-md-2">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['practice_managers'], 'Practice Managers', 'fa fa-users', 'practice_managers'); ?>
    </div>
    <div class="col-md-2">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['sub_practices'], 'Sub Practices', 'fa fa-users', 'sub_practices'); ?>
    </div>
    <div class="col-md-2">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['practices'], 'Practices', 'fa fa-gear', 'job_practices'); ?>
    </div>
</div>
<script>
<?php 
$labels = array();
$trend_data = array();
foreach ($content['job_trend'] as $key) {
	array_push($labels, $key['month_year']);
	array_push($trend_data, $key['count']);
}
?>
var lables = <?php echo json_encode($labels); ?>;
var data = <?php echo json_encode($trend_data); ?>;
const ctx = document.getElementById('jobTrendChart');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: lables,
        datasets: [{
            label: 'All time Job Trend', // Name the series
            data: data, // Specify the data values array
            fill: false,
            borderColor: '#01A982', // Add custom color border (Line)
            backgroundColor: '#FFF', // Add custom color background (Points and Fill)
            borderWidth: 2// Specify bar border width
        }]},
    options: {
      responsive: true, // Instruct chart js to respond nicely.
      maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
    }
});
</script>

<?php 
$open_labels = array();
$open_trend_data = array();
foreach ($content['job_open_trend'] as $key) {
	array_push($open_labels, $key['month_year']);
	array_push($open_trend_data, $key['count']);
}
?>
<script>
var open_lables = <?php echo json_encode($open_labels); ?>;
var open_trend_data = <?php echo json_encode($open_trend_data); ?>;
const open_trend_ctx = document.getElementById('jobOpenTrendChart');
var myChart = new Chart(open_trend_ctx, {
    type: 'line',
    data: {
        labels: open_lables,
        datasets: [{
            label: 'All time Open Job Trend', // Name the series
            data: open_trend_data, // Specify the data values array
            fill: false,
            borderColor: '#01A982', // Add custom color border (Line)
            backgroundColor: '#FFF', // Add custom color background (Points and Fill)
            borderWidth: 2// Specify bar border width
        }]},
    options: {
      responsive: true, // Instruct chart js to respond nicely.
      maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
    }
});
</script>