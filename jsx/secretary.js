var DocumentList = React.createClass({
  render: function() {
    return (
      <div className="documentList">
        <Document filename="Test">Doc</Document>
      </div>
    );
  }
});

var Document = React.createClass({
  render: function() {
    return (
      <div className="document">
        <h4 className="filename">
          {this.props.filename}
        </h4>
        {this.props.children}
      </div>
    );
  }
});

var WorkListView = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  render: function() {
    return (
      <div className="worklistBox">
        <h3>Worklist</h3>
        <DocumentList data={this.state.data} />
      </div>
    );
  }
});


React.render(
    <WorkListView />,
    document.getElementById('worklist')
);
