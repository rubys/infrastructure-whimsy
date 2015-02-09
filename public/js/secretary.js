var DocumentList = React.createClass({displayName: "DocumentList",
  render: function() {
    return (
      React.createElement("div", {className: "documentList"}, 
        React.createElement(Document, {filename: "Test"}, "Doc")
      )
    );
  }
});

var Document = React.createClass({displayName: "Document",
  render: function() {
    return (
      React.createElement("div", {className: "document"}, 
        React.createElement("h4", {className: "filename"}, 
          this.props.filename
        ), 
        this.props.children
      )
    );
  }
});

var WorkListView = React.createClass({displayName: "WorkListView",
  getInitialState: function() {
    return {data: []};
  },
  render: function() {
    return (
      React.createElement("div", {className: "worklistBox"}, 
        React.createElement("h3", null, "Worklist"), 
        React.createElement(DocumentList, {data: this.state.data})
      )
    );
  }
});


React.render(
    React.createElement(WorkListView, null),
    document.getElementById('worklist')
);
