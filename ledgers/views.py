from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate
from .models import Ledgers
from .forms import LedgersForm, LedgersUpdateForm
from django.contrib import messages

# 인증된 유저가 작성한 가계부가 아닐 경우 메시지 출력
def checkuser(request, ledger):
    if ledger.user != request.user:
        messages.warning(request, '접근 권한이 없습니다.')
        return True
    return False

@login_required
def index(request):
    user = request.user
    ledgers = Ledgers.objects.filter(user=user)
    context = {
        'ledgers': ledgers
    }
    return render(request, 'ledgers/index.html', context)

@login_required
def create(request):
    if request.method == 'POST':
        form = LedgersForm(request.POST)
        if form.is_valid():
            temp = form.save(commit=False)
            temp.paid_at = request.POST['paid_at']
            temp.user = request.user
            temp.save()
            return redirect('ledgers:index')
    else:
        form = LedgersForm()
    context = {
        'form': form
    }
    return render(request, 'ledgers/form.html', context)

@login_required
def update(request, ledger_pk):
    ledger = get_object_or_404(Ledgers, pk=ledger_pk)
    if checkuser(request, ledger):
        return redirect('main')
    if request.method == 'POST':
        form = LedgersUpdateForm(request.POST, instance=ledger)
        if form.is_valid():
            temp = form.save(commit=False)
            temp.user = request.user
            temp.save()
            return redirect('ledgers:index')
    else:
        form = LedgersUpdateForm(instance=ledger)
    context = {
        'form': form
    }
    return render(request, 'ledgers/form.html', context)

@login_required
def delete(request, ledger_pk):
    ledger = get_object_or_404(Ledgers, pk=ledger_pk)
    if checkuser(request, ledger):
        return redirect('main')
    ledger.delete()
    return redirect('ledgers:index')

@login_required
def detail(request, ledger_pk):
    ledger = get_object_or_404(Ledgers, pk=ledger_pk)
    if checkuser(request, ledger):
        return redirect('main')
    context = {
        'ledger': ledger
    }
    return render(request, 'ledgers/detail.html', context)

@login_required
def replica(request, ledger_pk):
    ledger = get_object_or_404(Ledgers, pk=ledger_pk)
    if checkuser(request, ledger):
        return redirect('main')
    ledger.pk = None
    ledger.save()
    return redirect('ledgers:index')