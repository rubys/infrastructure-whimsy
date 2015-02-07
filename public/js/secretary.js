var WorklistView = React.createClass({
  getInitialState: function() {
    return {data: []}
  },
  render: function() {
    return (
      <div className="worklist">
        <h2>Worklist</h2>
        <WorkList data={this.state.data} />
      </div>
    );
  }
});
