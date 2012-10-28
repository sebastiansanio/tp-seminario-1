<html>

<head>
	<title><g:message code="default.contact.title"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro">
		<p class="lead">
			For ongoing information about ${meta(name:'app.name')}, please read our company 
			<a href="http://wordpress.com/signup/">blog</a>. Also, feel free to
			contact us with service questions, partnership proposals, or media
			inquiries.
		</p>
	</section>

	<section id="address">
	<div class="row">
		<div class="span4">
			<h1><g:message code="default.contact.address"/></h1>
				<address>
					<strong>${meta(name:'app.name')}, Inc.</strong><br>
					 123 Future Ave<br>
					 San Francisco, CA 94107<br>
					 <br>
				</address>
				<address>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Phone">Phone</abbr></strong>
						</span>
						<span class="span3">
							(123) 456-7890
						</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Fax">Fax</abbr></strong>
						</span>
						<span class="span3">
					    +49 (0) 72 27 - 95 35 - 605
						</span>
					</div>
				</address>
				<address>
					<div class="row">
						<span class="span1">
							<strong>Email</strong>
						</span>
						<span class="span3">
					    	<a href="mailto:info@${meta(name:'app.name')}.com">info@${meta(name:'app.name')}.com</a>
						</span>
					</div>
				</address>
			</div>
			
			<div class="span8">
				<iframe width="100%" scrolling="no" height="300" frameborder="0" 
					src="http://maps.google.ca/maps?q=-34.617705,-58.368154&amp;num=1&amp;hl=es-419&amp;ie=UTF8&amp;t=m&amp;z=14&amp;ll=-34.61767,-58.368301&amp;output=embed"
		 			marginwidth="0" marginheight="0"></iframe>
			</div>
		</div>
	</section>

</body>

</html>
