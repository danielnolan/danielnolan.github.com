---
layout: post
title: Custom sort names EXTJS 4 grids

categories:
- Javascript

tags:
- Javascript
- Sencha
- EXTJS

description: This is a quick how to on adding custom column names to be sent to the server using EXTJS grids with
             server side (remote) sorting.
---
I build grids all the time in EXTJS 4 and they are usually dealing with a ton of data so server side sorting is a must.
EXTJS sends the header name of the grid column and and the sort direction to the server by default. That&#39;s all fine and dandy
but most of the time my column header names differ from the names I need to send to the server for proper sorting.
So here is what I came up with.

First I add a config called customSort to my column configs. The customSort will be the value that is sent to
the server when clicking the grid column header.

{% highlight javascript linenos%}

var gridColumns = [{
    text: 'Id',
    dataIndex: 'id',
    width: 75
},{
    text: 'Queue Cat',
    dataIndex: 'queue_cat',
    width: 100,
    customSort: 'DocumentQueueCategory.name'
},{
    text: 'Queued to Customer',
    dataIndex: 'queued_to_customer',
    flex: 1,
    customSort: 'User.lastname'
},{
    text: 'Locked By',
    dataIndex: 'locked_by',
    width: 150,
    customSort: 'LockedBy.lastname'
},{
    text: 'Last Act. Admin',
    dataIndex: 'last_activity_admin',
    width: 150,
    customSort: 'LastActAdmin.lastname'
},{
    text: 'Created',
    dataIndex: 'created',
    width: 110,
    format: 'm/d/y g:i a',
    xtype: 'datecolumn'
},{
    text: 'Modified',
    dataIndex: 'modified',
    width: 110,
    format: 'm/d/y g:i a',
    xtype: 'datecolumn'
}];

{% endhighlight %}


Then in the store for my grid I add some code to the before load listener to check
for a customSort param on each column. If the param is found the store will send
the customSort value to the server, if no customSort value is found it will send the column header name as normal.

{% highlight javascript linenos%}

listeners: {
  beforeload: function (store, options) {
    if(store.sorters.items[0]){
      var oldSortParam = store.sorters.items[0].property;
      for(var i=0; i < gridColumns.length; i++) {
        var currentCol = gridColumns[i];
        if(currentCol.sortable && currentCol.customSort &&
           currentCol.dataIndex == oldSortParam) {
             store.sorters.items[0].property =
             currentCol.customSort;
             break;
        }
     }
    }
  }
}

{% endhighlight %}




