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
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'purple', $count['last_30_day_jobs'], 'Last 30 days Open Jobs', 'fa fa-users', 'job/post'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'yellow', $count['last_60_day_jobs'], 'Last 60 days Open Jobs', 'fa fa-users', 'job/post'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'red', $count['last_90_day_jobs'], 'Last 90 days Open Jobs', 'fa fa-users', 'job/post'); ?>
    </div>
    <div class="col-md-12 bg-gray-light">
        <canvas id="jobTrendChart" width="300" height="300"></canvas>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['hiring_managers'], 'Hiring Managers', 'fa fa-users', 'hiring_managers'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['practice_managers'], 'Practice Managers', 'fa fa-users', 'practice_managers'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['sub_practices'], 'Sub Practices', 'fa fa-users', 'sub_practices'); ?>
    </div>
    <div class="col-md-3">
        <?php echo modules::run('adminlte/widget/info_box', 'green', $count['practices'], 'Practices', 'fa fa-gear', 'job_practices'); ?>
    </div>

</div>
<?php 
$labels = array();
$trend_data = array();
foreach ($content['job_trend'] as $key) {
	array_push($labels, $key['month_year']);
	array_push($trend_data, $key['count']);
}
$open_trend_data = array();
foreach ($content['job_open_trend'] as $key) {
	array_push($open_trend_data, $key['count']);
}

$closed_trend_data = array();
foreach ($content['job_closed_trend'] as $key) {
	array_push($closed_trend_data, $key['count']);
}
?>
<script>
var speedCanvas = document.getElementById("jobTrendChart");

var dataFirst = {
    label: "Job Trend",
    data: <?php echo json_encode($trend_data);?>,
    lineTension: 0,
    fill: false,
    borderColor: '#01A982'
};

var dataSecond = {
    label: "Actives Trend",
    data: <?php echo json_encode($open_trend_data);?>,
    lineTension: 0,
    fill: false,
    borderColor: 'red'
};

var dataThird = {
    label: "Closure Trend",
    data: <?php echo json_encode($closed_trend_data);?>,
    lineTension: 0,
    fill: false,
    borderColor: '#01A982'
};

var speedData = {
    labels: <?php echo json_encode($labels); ?>,
    datasets: [ dataSecond, dataThird]
};

var chartOptions = {
    responsive: true, // Instruct chart js to respond nicely.
    maintainAspectRatio: false, // Add to prevent default behaviour of full-width/height 
};

var lineChart = new Chart(speedCanvas, {
    type: 'line',
    data: speedData,
    options: chartOptions
});
</script>