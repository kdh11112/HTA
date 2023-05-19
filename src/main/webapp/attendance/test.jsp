<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



							

				<div class="row">
					<div class="col-xl-12">
						<div class="card">
							<div class="card-body">
								<div class="clearfix">


									<div class="card-body">
										<div class="d-flex align-items-center mb-3">
											<div class="avatar-xs me-3">
												<span
													class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
													<i class="bx bx-task"></i>
												</span>
											</div>
											<h5 class="font-size-16 mb-0">이번 주 근무</h5>
										</div>


										<div class="mt-4">
											<div data-simplebar="init" style="max-height: 400px;">
												<div class="simplebar-wrapper" style="margin: 0px;">
													<div class="simplebar-height-auto-observer-wrapper">
														<div class="simplebar-height-auto-observer"></div>
													</div>
													<div class="simplebar-mask">
														<div class="simplebar-offset"
															style="right: -17px; bottom: 0px;">
															<div class="simplebar-content-wrapper"
																style="height: auto; overflow: hidden scroll;">
																<div class="simplebar-content" style="padding: 0px;">
																	<div class="table-wrapper">
																		<div class="table-responsive fixed-solution"
																			data-pattern="priority-columns" >
																			<div class="sticky-table-header"
																				style="visibility: hidden; width: auto; top: -4.40625px;">
																				
																			</div>
																			<table
																				class="table table-nowrap align-middle table-hover mb-0"
																				style="height: 550px;">
																			<tbody>
																					<tr>
																						<td style="width: 50px;" data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck01"> <label
																									class="form-check-label" for="tasklistCheck01"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined"
																							id="todaysp">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="#" class="text-dark" id="week1"></a>&nbsp;
																								<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today1">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">

																							<div class="d-flex flex-wrap gap-3">

																								<a href="#" class="text-dark font-size-16"
																									data-bs-toggle="modal"
																									data-bs-target="#exampleModal"
																									data-bs-whatever="@mdo"> <span
																									class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																									&nbsp;${list.get(0).getWorksttsScTm()}
																								</a>

																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							${list.get(0).getWorksttsTm()} 시간
																						</td>

																					</tr>
																					<!-- 여기까지 반복해주세옹  -->
																					<tr>
																						<td style="width: 50px;" data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck01"> <label
																									class="form-check-label" for="tasklistCheck01"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week2"> </a>&nbsp;<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today2">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">

																							<div class="d-flex flex-wrap gap-3">
																								<a href="#" class="text-dark font-size-16"
																									data-bs-toggle="modal"
																									data-bs-target="#exampleModal"
																									data-bs-whatever="@mdo"> <span
																									class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																									&nbsp;${list.get(1).getWorksttsScTm()}
																								</a>

																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							시간</td>

																					</tr>

																					<tr>
																						<td style="width: 50px;" data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck01"> <label
																									class="form-check-label" for="tasklistCheck01"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week3"> </a>&nbsp;<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today3">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">

																							<div class="d-flex flex-wrap gap-3">

																								<a href="#" class="text-dark font-size-16"
																									data-bs-toggle="modal"
																									data-bs-target="#exampleModal"
																									data-bs-whatever="@mdo"> <span
																									class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																									&nbsp;${list.get(2).getWorksttsScTm()}
																								</a>

																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							시간</td>

																					</tr>

																					<tr>
																						<td style="width: 50px;" data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck01"> <label
																									class="form-check-label" for="tasklistCheck01"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week4"> </a>&nbsp;<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today4">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">

																							<div class="d-flex flex-wrap gap-3">

																								<a href="#" class="text-dark font-size-16"
																									data-bs-toggle="modal"
																									data-bs-target="#exampleModal"
																									data-bs-whatever="@mdo"> <span
																									class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																									&nbsp;${list.get(3).getWorksttsScTm()}
																								</a>

																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							시간
																						</td>

																					</tr>

																					<tr>
																						<td style="width: 50px;" data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck01"> <label
																									class="form-check-label" for="tasklistCheck01"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week5"> </a>&nbsp;<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today5">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">

																							<div class="d-flex flex-wrap gap-3">

																								<a href="#" class="text-dark font-size-16"
																									data-bs-toggle="modal"
																									data-bs-target="#exampleModal"
																									data-bs-whatever="@mdo"> <span
																									class="badge badge-pill badge-soft-secondary font-size-14">근무</span>
																									&nbsp;
																								</a>

																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							시간
																						</td>

																					</tr>

																					<tr>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck06"> <label
																									class="form-check-label" for="tasklistCheck06"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week6"> </a>&nbsp;<span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today6">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div>
																								<span
																									class="badge badge-pill badge-soft-success font-size-12">쉬는날</span>
																							</div>
																						</td>
																					</tr>
																					<tr>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																									id="tasklistCheck07"> <label
																									class="form-check-label" for="tasklistCheck07"></label>
																							</div>
																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<h5 class="text-truncate font-size-16 mb-1">
																								<a href="javascript: void(0);" class="text-dark"
																									id="week0"> </a><span
																									class="badge badge-pill badge-soft-success font-size-12"
																									id="today0">오늘</span>
																							</h5>

																						</td>
																						<td data-org-colspan="1"
																							data-columns="id3c6e7ddbeb24f-col-undefined">
																							<span
																							class="badge badge-pill badge-soft-success font-size-12">쉬는날</span>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<!-- <div class="simplebar-placeholder"
														style="width: auto; height: 800px;"></div> -->
												</div>
												<!-- <div class="simplebar-track simplebar-horizontal"
													style="visibility: hidden;">
													<div class="simplebar-scrollbar"
														style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
												</div>
												<div class="simplebar-track simplebar-vertical"
													style="visibility: visible;">
													<div class="simplebar-scrollbar"
														style="height: 20px; transform: translate3d(0px, 134px, 0px); display: none;"></div>
												</div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


</body>
</html>